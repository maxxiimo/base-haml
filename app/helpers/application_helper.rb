module ApplicationHelper
  def head
    render :partial => 'layouts/head'
  end

  def scripts
    render :partial => 'layouts/scripts'
  end

  def browsehappy
    render :partial => 'layouts/browsehappy'
  end
end
