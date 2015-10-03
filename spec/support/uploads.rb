module Support
  module Uploads
    extend self

    def test_file(filename)
      Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', filename))
    end
  end
end
