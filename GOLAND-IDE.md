# GoLand IDE caveats

Can't just do a terminal/alias integration with the binary. Have to actually work with the editor itself.

https://penkovski.com/post/start-goland-from-command-line/

^ TL;DR from the above:

- Open GoLand and click the top menu Tools >> Create Command-line Launcher...
- Under "Create Launcher Script", enter the path `/usr/local/bin/goland`
- Create alias pointing to the launcher file (this is already done under [CLI Utils directory in this repo](./cli-utils/.alias)