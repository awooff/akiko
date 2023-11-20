<img align="left" width="100" padding-right="6px" height="100" src="./readme/logo.png">

# Akiko

Lichess multi-bot interface, designed for performance and modularity.

## Features

- Multi-bot support
- UCI compatible engine support
- Matchmaking
- Offering draws/resigns

### WIP

- [ ] Save your games in PGN!
- [ ] Optional database integration
- [ ] Grafana dashboard to view engine stats

## Installation

1. Download this repository. `git clone https://gitlab.com/kaelta/akiko`
2. Add your engine into the _engines_ folder. You can do this as a git submodule, and probably should.
3. Enter the name of your engine, its path, and the token for your engine in the _config.yml_.
4. `shards build --release`
5. `./bin/akiko`

## Usage

WIP
`akiko -h` will show you all the available flags and config options.

## Contributing

1. Fork it (<https://gitlab.com/kaelta/akiko/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [kaelta](https://gitlab.com/kaelta) - creator and maintainer
