class ApplicationController < ActionController::Base
  #  protect_from_forgery with: :exception

  def index
    @questions = Question.all
  end


  def do_post(answer, task_id)
    uri = URI('http://pushkin.rubyroidlabs.com/quiz')
    parametrs = {
      'answer' => answer,
      'token'  => ENV['TOKEN'],
      'task_id' => task_id
    }
    Net::HTTP.post_form(uri, parametrs)
    end
end
