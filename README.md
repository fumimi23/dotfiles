# dotfiles

macOS（zsh）と WSL Ubuntu（bash）のシェル設定。

## 構成

| パス | 内容 |
|---|---|
| `common/env.sh` | bash / zsh 共通の環境変数 |
| `common/init.sh` | bash / zsh 共通の対話シェル初期化（mise・starship・エイリアス） |
| `common/aliases.sh` | エイリアス |
| `.zsh/` | macOS（zsh）固有の設定。`ZDOTDIR` で読み込む |
| `.bash/` | WSL Ubuntu（bash）固有の設定。`BASHDOTDIR` で読み込む |
| `mise/global.toml` | mise のグローバル設定。`MISE_GLOBAL_CONFIG_FILE` で参照する |
| `starship.toml` | プロンプト設定。`STARSHIP_CONFIG` で参照する |

ツールのバージョンは mise で管理する。各リポジトリの `.node-version` / `.python-version` / `mise.toml` を読み、`package.json` の `packageManager` で固定した yarn / pnpm は corepack 経由で使う。

mise のグローバル設定は `mise/global.toml` だけが読まれ、`~/.config/mise/` 配下は読まれない。`mise use -g` もこのファイルを書き換える。

## セットアップ

```shell
git clone https://github.com/fumimi23/dotfiles.git ~/dotfiles
```

### macOS（zsh）

1. `$HOME/.zshenv` に追記

    ```shell
    # My dotfiles
    if [ -d "$HOME/dotfiles/.zsh" ] ; then
        export ZDOTDIR=$HOME/dotfiles/.zsh
        source $ZDOTDIR/.zshenv
    fi
    ```

2. Homebrew で必要なパッケージをインストール

    ```shell
    brew install starship mise grep zsh-completions
    exec $SHELL -l
    ```

### WSL Ubuntu（bash）

1. `$HOME/.bashrc` に追記

    ```shell
    # My dotfiles
    if [ -d "$HOME/dotfiles/.bash" ] ; then
        export BASHDOTDIR=$HOME/dotfiles/.bash
        source $BASHDOTDIR/.bashrc
    fi
    ```

2. starship と mise をインストール

    ```shell
    curl -sS https://starship.rs/install.sh | sh
    curl https://mise.run | sh
    exec $SHELL -l
    ```

### リポジトリごとの初回作業

```shell
cd <リポジトリ>
mise install
```
