cask "mynik" do
  version "1.0.0"
  sha256 "3d7cd03bcb9c8d4a27490660e9b6b49b35e2f0aba15ebd171424ccb42d470541"

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
