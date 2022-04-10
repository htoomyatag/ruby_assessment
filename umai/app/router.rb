class Router
  def initialize(request)
    @request = request
  end

  def route!
    if klass = controller_class
      add_route_info_to_request_params!

      controller = klass.new(@request)
      action = route_info[:action]

      if controller.respond_to?(action)
        puts "\nRouting to #{klass}##{action}"
        return controller.public_send(action)
      end
    end

    not_found
  end

  private

  def add_route_info_to_request_params!
    @request.params.merge!(route_info)
  end


  def controller_name
    "#{route_info[:resource].capitalize}Controller"
  end


  def controller_class
    Object.const_get(controller_name)
  rescue NameError
    nil
  end

  def route_info
    @route_info ||= begin
      resource = path_fragments[0] || "base"
      id, action = find_route(path_fragments[1])
      { resource: resource, id: id, action: action }
    end
  end


  def find_route(fragment)
    case fragment
    when 'ip_address_list'
      [nil, :ip_address_list]
    when 'create_user'
      [nil, :create_user]
    when 'authenticate'
      [nil, :authenticate]
    when 'create_rating'
      [nil, :create_rating]
    when 'top_post_by_avg_rating'
      [nil, :top_post_by_avg_rating]
    when 'create_post'
      [nil, :create_post] 
    when 'add_feedback'
      [nil, :add_feedback]        
    else
    end
  end


  def path_fragments
    @fragments ||= @request.path.split("/").reject { |s| s.empty? }
  end


  def not_found(msg = "Not Found")
    [404, { "Content-Type" => "text/plain" }, [msg]]
  end
end
