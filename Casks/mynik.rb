cask "mynik" do
  version "1.1.0"
  sha256 "72edb0e9540e367bbae98dd0651a85cb7d6798c442876ad5ef75a2f264219034"

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
