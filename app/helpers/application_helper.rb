module ApplicationHelper
  def head
    render 'layouts/head'
  end

  def scripts
    render 'layouts/scripts'
  end

  def browsehappy
    render 'layouts/browsehappy'
  end
end
