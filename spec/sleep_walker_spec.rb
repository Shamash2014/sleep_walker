RSpec.describe SleepWalker do
  it "has a version number" do
    expect(SleepWalker::VERSION).not_to be nil
  end

  describe "Planner" do
    before do
      new_time = Time.local(2008, 9, 1, 12, 0, 0)
      Timecop.freeze(new_time)
    end

    after do
      Timecop.return
    end

    it 'raises error when no crontab definition given' do
      expect{SleepWalker::Planner.run}.to raise_error(ArgumentError)
    end

    it 'parses every month crontab and outputs {}' do
      crontab = "5 3 2 * *"
      expect(SleepWalker::Planner.run(crontab: crontab, days: 100)).to eql({
        "2008-09-02" => [1220317500],
        "2008-10-02" => [1222909500],
        "2008-11-02" => [1225587900],
        "2008-12-02" => [1228179900],
      })
    end
  end
end
