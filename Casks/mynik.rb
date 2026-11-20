cask "mynik" do
  version "0.6.0"
  sha256 "2bba2176511ce4a023f5af1aabd871184736e83e4c090d11c0a8c98e5768263a"

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
