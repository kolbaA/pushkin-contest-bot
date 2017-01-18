class QuestionController < ApplicationController
  def new
    head :ok, content_type: 'text/html'
    @question = params[:question]
    @task_id = params[:id]
    search_answer(params[:level])
    #@answer = Answer.new(value: @question.send(leveler(params[:level]).to_s, task_id: @question.id)
    Question.create(question_params)
    Answer.create(answer_params)
  end

  def question_params
    params.permit(:question, :id, :level)
  end

  def answer_params
    {
      question_id: params[:id],
      value: @answer
      task_id: params[:id]
    }
  end

  def search_answer(level)
    case level
    when 1
      do_post(level1,@task_id)
    when 2 | 3 | 4
      do_post(level2to4,@task_id)
    when 5
      do_post(level5,@task_id)
    when 6
      do_post(level6,@task_id)
    when 7
      do_post(level7,@task_id)
    when 8

    end

  def level1
    start = Time.now
    @answer = POEMS[@question.strip.to_s]
    puts "#{(Time.now - start)*1000}ms | LEVEL1"
    @answer
  end

  def level2to4
    start = Time.now
    lines = @question.split("\n")
    answer = []
    lines.each { |line| answer << POEMS_WITHOUT_WORD[line.strip.to_s] }
    @answer = answer.reject(&nil).to_a.join(',')
    puts "#{(Time.now - start)*1000}ms | LEVEL2to4"
    @answer
  end

  def level5
    start = Time.now
    words = @question.split(' ')
    answer = []
    words.each_with_index do |val, index|
      words[index] = '%WORD%'
      needed_word = POEMS_WITHOUT_WORD[words.join(' ').strip.to_s]
      unless needed_word.eql?(nil)
        answer << needed_word
        answer << val
        break
      end
      words[index] = val
    end
    @answer = answer.join(',')
    puts "#{(Time.now - start)*1000}ms | LEVEL5"
    @answer
  end

  def level6
    start = Time.now
    answer = []
    line = @question.split(' ')
    line.each { |w| answer << w.split('').sort.join('') }
    @answer = POEMS_FOR_6_LEVEL[answer.join(' ').to_s]
    puts "#{(Time.now - start)*1000}ms | LEVEL6"
    @answer
  end

  def level7
    start = Time.now
    answer = @question.split('').sort.join('')
    @answer = POEMS_FOR_7_LEVEL[answer.to_s]
    puts "#{(Time.now - start)*1000}ms | LEVEL6"
    @answer
  end

  def level8
      
  end
end
