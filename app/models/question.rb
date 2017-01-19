class Question < ApplicationRecord
  has_one :answer

  def level1
    POEMS[question.strip.to_s]
  end

  def level2to4
    lines = question.split("\n")
    answer = []
    lines.each { |line| answer << POEMS_WITHOUT_WORD[line.strip.to_s] }
    answer = answer.reject(&nil).to_a.join(',')
  end

  def level5
    words = question.split(' ')
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
    answer.join(',')
  end

  def level6
    answer = []
    line = question.split(' ')
    line.each { |w| answer << w.split('').sort.join('') }
    POEMS_FOR_6_LEVEL[answer.join(' ').to_s]
  end

  def level7
    answer = question.split('').sort.join('')
    POEMS_FOR_7_LEVEL[answer.to_s]
  end

  def level8
    start = Time.now
       @question = @question.split('').sort.join('').strip
       POEMS_FOR_7_LEVEL.each_pair do |key,val|
      ar1 = key.strip.split('') - @question.split('')
      ar2 = @question.split('') - key.strip.split('')
      if (ar1.size == 1) && (ar2.size == 1)
        @result_answer  = val
        break
        end
      end

       puts "#{(Time.now - start)*1000}ms | LEVEL 8"
    puts @result_answer
       @result_answer

end

end
