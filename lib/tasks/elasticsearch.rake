namespace :elasticsearch do
  desc "This command belongs to importing docs inside elasticsearch indexes"

  task import: do
    model       = ENV['model'].to_s.downcase

    if model.empty? || !%w[category product].include?(model)
      puts "You need to specify the imported model ex: rails elasticsearch:import model=Category"
      exit 0
    end

    if model === "category"
      puts "Start importing #{model} ....."
      Category.import batch_size: ENV['batch_size'].to_i || 100
    end

    if model === "product"
      puts "Start importing #{model} ....."
      Product.import batch_size: ENV['batch_size'].to_i || 100
    end

    puts "#{model} was imported successfully"
  end
end
