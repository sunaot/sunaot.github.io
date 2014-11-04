require_relative '../lib/generator'

this = Pathname.new(__FILE__)
SLIDE_DIR = this.dirname + '../'
NAME = this.basename(this.extname)

s = Slide.define(NAME, root_path: SLIDE_DIR) do
  title       'Unit testing in Ruby'
  description 'First step guide to unit test in Ruby'
  author      'sunaot'
  filename    "#{NAME}.md"
end
s.generate
