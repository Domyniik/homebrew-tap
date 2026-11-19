cask "mynik" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/Domyniik/mynik/releases/download/v#{version}/Mynik-#{version}.zip"
  name "Mynik"
  desc "Dashboard pessoal: finanças, contas a pagar, loja, projetos e notas"
  homepage "https://github.com/Domyniik/mynik"

  depends_on macos: ">= :tahoe"

  app "Mynik.app"

  # A app ainda não é notarizada pela Apple: retira a quarentena para abrir sem bloqueio.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mynik.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Containers/com.domynik.mynik",
  ]
end
