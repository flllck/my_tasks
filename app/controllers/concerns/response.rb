module Response
  def json_response(object, status = :ok, item = nil)
    render json: object, status: status, include: item
  end
end