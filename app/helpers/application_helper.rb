module ApplicationHelper

  def do_post(answer)
    #uri = URI('http://localhost:3000/')
    parametrs = {
      'answer' => params[:question],
      'token'       => params[:id],
      'task_id'    => params[:level]
    }
    Net::HTTP.post_form(uri, parametrs)
  end
end
