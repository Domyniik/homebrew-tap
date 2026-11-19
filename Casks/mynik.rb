cask "mynik" do
  version "0.1.0"
  sha256 "75b8122618e956f035cd6d6038f30f70f659cfc32b18efc1aa90f7da5d2ca28f"

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
