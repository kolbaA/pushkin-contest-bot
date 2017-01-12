module QuestionHelper
  def true_level(level)
    if level.eql?('level2') | level.eql?('level3') | level.eql?('level4')
      level = 'level2-4'
    end
    level
  end
end
