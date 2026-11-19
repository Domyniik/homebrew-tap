# homebrew-tap

Tap do Homebrew com as apps do [Domyniik](https://github.com/Domyniik).

## Mynik

Dashboard pessoal para macOS: finanças, contas a pagar, loja, projetos e notas. Ver [Domyniik/mynik](https://github.com/Domyniik/mynik).

```bash
brew install --cask domyniik/tap/mynik
```

Atualizar:

```bash
brew update && brew upgrade --cask mynik
```

Desinstalar (e apagar os dados com `--zap`):

```bash
brew uninstall --cask --zap mynik
```

> Requer macOS 26 (Tahoe) ou mais recente. A app ainda não é notarizada pela Apple; a cask retira a quarentena na instalação para que abra sem bloqueio.
