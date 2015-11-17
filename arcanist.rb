require 'formula'

class Arcanist < Formula
  homepage 'http://phabricator.org'

  # the releases (below) are super out of date, but homebrew needs these in the definition
  url 'https://github.com/phacility/arcanist/archive/conduit-5.tar.gz'
  sha256 '81a9599f0799f4a2b77a01ddb35275894b82d8e51f437b51f9342affd029aa8b'

  def install

    # clone arcanist
    system 'git', 'clone', 'https://github.com/phacility/arcanist.git'

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
