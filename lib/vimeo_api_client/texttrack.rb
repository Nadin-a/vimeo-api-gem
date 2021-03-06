module Vimeo
  class TextTrack < Resource

    def index(options = {})
      get("/videos/#{video_id}/texttracks", options)
    end

    def show(options = {})
      get("/videos/#{video_id}/texttracks/#{@id}", options)
    end

    # type
    # language
    # name
    # active
    # file
    def create(options)
      response = post("/videos/#{video_id}/texttracks", options)
      upload_file(response.link, options[:file]) if options[:file]
      response
    end

    def upload_file(upload_link, file_url)
      file_data = File.read(file_url)
      put(upload_link, file_data)
    end

    def update(options)
      patch("/videos/#{video_id}/texttracks/#{@id}", options)
    end

    def destroy
      delete("/videos/#{video_id}/texttracks/#{@id}")
    end

  end
end
