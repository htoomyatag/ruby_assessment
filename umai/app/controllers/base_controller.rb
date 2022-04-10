require 'json'

class BaseController
  attr_reader :request

  def status_success(msg = "200")
    [200, { "Content-Type" => "text/plain" }, [msg]]
  end

  def error_validation(msg = "422")
    [422, { "Content-Type" => "text/plain" }, [msg]]
  end

  def unauthorized(msg = "401")
    [401, { "Content-Type" => "text/plain" }, [msg]]
  end


  def initialize(request)
    @request = request
  end


  def index
    build_response render_template
  end


  private

  def build_response(body, status: 200)
    [status, { "Content-Type" => "text/html" }, [body]]
  end

  def redirect_to(uri)
    [302, { "Location" => uri }, []]
  end


  def params
    request.params
  end

  def render_json(name = params[:action])
    templates_dir = self.class.name.downcase.sub("controller", "")
    template_file = File.join(templates_dir, "#{name}.json")

    file_path = template_file_path_for(template_file)

    if File.exists?(file_path)
      puts "Rendering template file #{template_file}"
      render_erb_file(file_path)
    else
      "ERROR: no available template file #{template_file}"
    end
  end


  def template_file_path_for(file_name)
    File.expand_path(
      File.join("../../views", file_name),
      __FILE__
    )
  end


  def render_erb_file(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

end
