class ApplicationController < ActionController::Base
  #  protect_from_forgery with: :exception

  def index
    binding.pry
    @questions = Question.all
  end


  def do_post(answer)
    uri = URI('http://pushkin.rubyroidlabs.com/quiz')
    parametrs = {
      'answer' => answer.value,
      'token'  => ENV['TOKEN'],
      'task_id' => answer.task_id
    }
    Net::HTTP.post_form(uri, parametrs)
    end
end
