alias TalonDemo.{Repo, Country, State, User} #, Tag, Group}
alias FakerElixir, as: Faker


countries = Repo.all Country

states = Repo.all(State) |> Repo.preload([:country])

_users =
  for _ <- 1..5000 do
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
