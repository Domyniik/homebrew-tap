cask "mynik" do
  version "0.5.0"
  sha256 "a44069aab8f33d6389c77dc58d535093c45f55c0628cf85cad985f76dcbc82bf"

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
