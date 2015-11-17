require 'formula'

class Arcanist < Formula
  homepage 'http://phabricator.org'
  url 'https://github.com/phacility/arcanist.git', :using => :git
  version 'head'

  def install

    # clone arcanist
    system 'git', 'clone', url

    # clone libphutil into arcanist's includes
    cd 'arcanist/externals/includes' do
      system 'git', 'clone', 'https://github.com/phacility/libphutil.git'
    end

    # copy the whole cloned dir (including includes) to Cellar
    prefix.install 'arcanist'

    # symlink arc's bin to where homebrew expects a bin
    bin.install_symlink prefix + 'arcanist/bin/arc'

  end

end
