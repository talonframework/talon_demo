# TalonDemo

A sample app used for prototyping ideas for the talon redesign.

I have only implemented the User, State, and Country schema's so far. The seeds.exs file a log of seed data for these schemas.

NOTE: This project has been updated to Phx 1.3 structure.

## Installation

```bash
git clone https://github.com/talonframework/talon_demo.git
cd talon_demo
mix do deps.get, ecto.setup
cd assets
yarn  # or, npm install
cd .. # back to the root
iex -S mix phx.server
```

### Setting up for Talon Dev

1. Fork the talonframework/talon repo
2. Clone locally
3. Change the dep to `{:talon, path: "../talon"}`
4. Run `mix deps.get`

## Contributing

The new Talon architecture is under very active development. So, expect significant changes as we explore architectural and feature ideas.

Before starting to work on anything, please have a quick conversation with @smpallen99 on the relevant issue on [talonframework/talon](https://github.com/talonframework/talon/issues). If an issues does not exist, please create one. For realtime discussions, @smpallen99 can be reached on:

* #exadmin channel in https://chat.spallen.com (preferred - my own Phoenix chat app)
* #exadmin channel in Elixir's slack team
* skype `wedge99` (one-on-one voice/video)

## TODO
- [X] Prototype a theme based template generator for master site
- [X] Index page using datatables
- [X] Sample Edit/New pages
- [X] New pluggable controller architecture
- [X] Default admin-lte template
- [X] Sidenav bar
- [X] Gettext archecture similar to Coherence
- [X] Move the project over to phx-1.3 architecture
- [ ] Prototype resource based template overlays
- [ ] Create a generator for generating the default template .eex files
- [X] Implement the create/update/delete actions in the controller
- [X] Fix the brunch problem pulling the the skins
- [X] Add database backended support for the index page datatables
- [X] Add a show template
- [X] Add links to the index page actions
- [ ] Index page filters (new design required). With live searching on the index page datatables, not sure if the existing Talon design even makes sense anymore.
- [ ] User new/edit state select should only show options based on the selected country.
- [ ] Implenent boolean on/off toggle
- [ ] Implement date/time selection
- [ ] Implement remaining data types
- [ ] Add many-to-many support (Group and Tag schema already done)
- [ ] Multi-language support
- [ ] Much more

