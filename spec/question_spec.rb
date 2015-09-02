require 'spec_helper'

describe(Question) do
  it('returns false if there is no description') do
    test_question = Question.new({:description => ""})
    expect(test_question.save).to(eq(false))
  end
end
