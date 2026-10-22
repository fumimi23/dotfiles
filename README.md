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

ツールのバージョンは mise で管理する。各リポジトリの `.node-version` / `.python-version` / `mise.toml` を読み、`package.json` の `packageManager` で固定した yarn / pnpm は corepack 経由で使う。starship や terraform のような、どのリポジトリにも属さないツールは `mise/global.toml` にグローバルに固定する。

mise のグローバル設定は `mise/global.toml` だけが読まれ、`~/.config/mise/` 配下は読まれない。`mise use -g` もこのファイルを書き換える。

## セットアップ

```shell
git clone https://github.com/fumimi23/dotfiles.git ~/dotfiles
```

### 1. シェルから読み込ませる（OS ごとの差分）

#### macOS（zsh）

`$HOME/.zshenv` に追記する。

```shell
# My dotfiles
if [ -d "$HOME/dotfiles/.zsh" ] ; then
    export ZDOTDIR=$HOME/dotfiles/.zsh
    source $ZDOTDIR/.zshenv
fi
```

GNU grep と zsh 補完だけは mise ではなく Homebrew で入れる。

```shell
brew install grep zsh-completions
```

#### WSL Ubuntu（bash）

`$HOME/.bashrc` に追記する。

```shell
# My dotfiles
if [ -d "$HOME/dotfiles/.bash" ] ; then
    export BASHDOTDIR=$HOME/dotfiles/.bash
    source $BASHDOTDIR/.bashrc
fi
```

### 2. mise とツールを入れる（共通）

```shell
curl https://mise.run | sh
exec $SHELL -l
mise install
```

mise は Homebrew や apt ではなく公式インストーラで入れる。パッケージマネージャ経由で入れると `mise self-update` が無効化されるため。

### 3. リポジトリごとの初回作業

```shell
cd <リポジトリ>
mise trust
mise install
```
