# Tmuxinator Usage

## Description
[tmuxinator](https://github.com/tmuxinator/tmuxinator) is an easy way to create [tmux](https://github.com/tmux/tmux) session using YAML files. In the below example, we will create a single window with 4 tiles.

## Usage
### Create a new tmux session called "example1"
`mux new example1`

### Tmuxinator creates a sample example1.yaml file which we don't need
`echo > ~/.tmuxinator/example1.yaml`

### Create a blank example1.yaml file using your preffered text editor and paste the contents below

    name: example1
    windows:
      - Window1:
          layout: tiled
          panes:
            -
            -
            -
            -

##Screenshots
Here is PuTTY at 145x45 showing 4 tiles in 1 tmux window:

![145-45](https://raw.githubusercontent.com/64b2b6d12b/awesome-console/master/145-45.PNG)

Here is the same PuTTY session at 130x30 which automatically resizes:

![100-30](https://raw.githubusercontent.com/64b2b6d12b/awesome-console/master/100-30.PNG)
