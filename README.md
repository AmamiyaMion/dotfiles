# dotfiles
My dotfiles and other system configuration files, with a lua script `dottools.lua` to help you manage them. 

**Note: The script copies dotfiles instead of soft linking them.**

## Usage
### Syncing system files to dotfiles storage
```bash
./dottool.lua sync
```
### Applying dotfiles to system
```bash
./dottool.lua apply
```

## Configuration
Configs are stored in `dotfiles.toml`.
### Example config
```toml
[some_config] # Currently this is only something to help you remember what the dotfile is. 
file = "/etc/some_config_file" # Where the dotfile should be in your system. Relative paths are supported. 
store = "some_config_file.conf" # The relative path your dotfile is stored. 
sudo = true # If copying the dotfile requires root previliages, set this to true. Otherwise set it to false or leave it unset. 
```