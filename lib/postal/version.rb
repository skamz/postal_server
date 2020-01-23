module Postal

  VERSION = '1.0.0'
  REVISION = 'f1bee5644b'
  CHANNEL = 'stable'

  def self.version
    [VERSION, REVISION, CHANNEL].compact.join('-')
  end

end
