class QuestionController < ApplicationController
  def new
    head :ok, content_type: 'text/html'
    @question = Question.new(question_params)
    @answer = Answer.new(value: @question.send(leveler(params[:level].to_s)), task_id: @question.task_id)
    do_post(@answer)
    Thread.new do
      Question.create(question_params)
      Answer.create(answer_params)
    end
  end

  def question_id
    Question.all.last.id
  end

  def question_params
    params.permit(:question, :task_id, :level)
  end

  def answer_params
    {
      question_id: question_id,
      value: @answer.value,
      task_id: @answer.task_id
    }
  end

  def leveler(level)
    if level.eql?('2') | level.eql?('3') | level.eql?('4')
      level = 'level2to4'
    end
    "level#{level}"
  end
end
