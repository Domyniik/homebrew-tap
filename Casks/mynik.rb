cask "mynik" do
  version "0.7.0"
  sha256 "5058b9b32449fea25e2fa739c82427f75e2ea8ab1b04d4be717e51c1a17501f4"

  url "https://github.com/Domyniik/mynik/releases/download/v#{version}/Mynik-#{version}.zip"
  name "Mynik"
  desc "Dashboard pessoal: finanças, contas a pagar, loja, projetos e notas"
  homepage "https://github.com/Domyniik/mynik"

  depends_on macos: :tahoe

  app "Mynik.app"

  # A app não é notarizada pela Apple: retira a quarentena para abrir sem bloqueio.
  postflight_steps do
    if_path_exists "{{appdir}}/Mynik.app" do
      run "/usr/bin/xattr",
          args: ["-dr", "com.apple.quarantine", "{{appdir}}/Mynik.app"]
    end
  end

  uninstall quit: "com.domynik.mynik"

  zap trash: [
    "~/Library/Containers/com.domynik.mynik",
    "~/Library/Containers/com.domynik.mynik.widgets",
    "~/Library/Group Containers/CJ7Y2P3TKF.com.domynik.mynik",
  ]
end
