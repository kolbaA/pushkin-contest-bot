class QuestionController < ApplicationController
  def new
    head :ok, content_type: 'text/html'
    @question = Question.new(question_params)
    start = Time.now
    @answer = Answer.new(value: @question.send(leveler(params[:level]).to_s, task_id: @question.id)
    puts "#{(Time.now - start) * 1000}ms"
    thr = Thread.new do
      do_post(@answer)
      Question.create(question_params)
      Answer.create(answer_params)
      thr.kill
    end
  end

  def question_params
    params.permit(:question, :id, :level)
  end

  def answer_params
    {
      question_id: @question.id,
      value: @answer.value,
      task_id: @answer.task_id
    }
  end

  def leveler(level)
    if level.eql?(2) | level.eql?(3) | level.eql?(4)
      level = 'level2to4'
    else
      level = "level#{level}"
    end
      level
  end
end
