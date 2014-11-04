require 'erb'
require 'pathname'


class Slide
  class Configuration < Struct.new(:title, :author, :description, :slides_filename)
    def bind
      binding
    end
  end

  class Configurator
    Configuration.members.each do |name|
      define_method(name) do |value|
        instance_variable_set("@#{name}", value)
      end
    end
    alias_method :filename, :slides_filename

    def config
      params = Configuration.members.map {|name| instance_variable_get "@#{name}" }
      Configuration.new(*params)
    end
  end

  HTML_TEMPLATE = Pathname.new(__FILE__).dirname + 'index.template.erb.html'
  attr_reader :root_path, :name, :config

  def initialize(name, root_path, config = Configuration.new)
    @name = name
    @root_path = root_path
    @config = config
  end

  def generate
    index_html = ERB.new(HTML_TEMPLATE.read, nil, '-').result(@config.bind)
    (root_path + name).mkpath
    generate_index_html(index_html)
  end

  def self.define(name, root_path: Pathname.new('.'), &block)
    c = Configurator.new
    c.instance_eval &block
    new(name, root_path, c.config)
  end

  private
  def generate_index_html(index_html)
    (root_path + name + 'index.html').open('w') {|f| f.write(index_html) }
  end
end


if $0 == __FILE__
  s = Slide.define('foo', root_path: Pathname.new('./test')) do
    title       'Foo'
    description 'とても長い説明'
    author      'myname'
    filename    'filename.md'
  end
  s.generate
end
