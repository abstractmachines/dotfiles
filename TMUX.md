# tmux

## 101

- See [Ham Vocke's tmux guide](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
- and [part 2](https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/)

> Source config:

```
tmux source ~/.tmux/.tmux.conf
```

> Split pane

```
C-b %
```

> Resize pane

- 1. Bring up CLI prompt:
  ```sh
  C-b :
  ```
- Now you're in prompt, so resize the pane as follows.
  - - D, U, L, R (down, up, left, right) direction.
  - - Example: resize pane left by 40 more cells:
      ```
      resize-pane -L 40
      ```
  - - Example: resize pane left by 40 more cells:
      ```
      resize-pane -L 40
      ```

> Close pane

```
C-b x
```

> cli: `<prefix> : <cmd>`

```
C-b : <cmd>
```

> List all sessions

```
tmux ls
```

> Detach session

```
C-b d
```

// To detach session and choose, `C-b D`.

> Kill all sessions

```
tmux kill-server
```
