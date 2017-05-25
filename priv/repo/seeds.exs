alias TalonDemo.{Repo, Country, State, User} #, Tag, Group}
alias FakerElixir, as: Faker

Repo.delete_all State
Repo.delete_all Country
Repo.delete_all User

countries =
  for _ <- 1..50 do
    co = Faker.Address.make_country()
    Repo.insert! Country.changeset(%Country{}, co)
  end

states =
  countries
  |> Enum.take(10)
  |> Enum.map(fn co ->
    for _ <- 1..10 do
      state = Faker.Address.state()
      {state, code} =
        state
        |> String.split(" ")
        |> case do
          [one] ->
            code =
              one
              |> String.slice(0, 2)
              |> String.upcase
            {state, code}
          [first, second | _] ->
            code =
              String.first(first) <> String.first(second)
              |> String.upcase
            {state, code}
        end
      Repo.insert!(State.changeset(%State{}, %{name: state, code: code, country_id: co.id}))
      |> Repo.preload([:country])
    end
  end)
  |> List.flatten

_users =
  for _ <- 1..500 do
    name = Faker.Name.name()
    state = Enum.random(states)
    Repo.insert! User.changeset(%User{},
      %{
        name: name,
        email: Faker.Internet.email(name),
        user_name: Faker.Internet.user_name(name),
        street_num: Faker.Address.building_number(),
        street: Faker.Address.street_name(),
        city: Faker.Address.city(),
        state_id: state.id,
        country_id: state.country.id,
        zip_code: Faker.Address.zip_code(),
        active: Enum.random([true, false]),
        height: Enum.random(54..78),
        birthdate: Ecto.Date.cast!(FakerElixir.Date.birthday()),
      })
  end
