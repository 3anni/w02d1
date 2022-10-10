# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            nil
        elsif self[0].is_a?(Integer) || self[0].is_a?(Float)
            self.max - self.min
        end
    end

    def average
        if self.length == 0
            nil
        elsif self[0].is_a?(Integer) || self[0].is_a?(Float)
            self.sum / (self.length * 1.0)
        end
    end

    def median
        if self.length == 0
            nil
        elsif self[0].is_a?(Integer) || self[0].is_a?(Float)
            sorted = self.sort
            mid = self.length / 2
            if self.length % 2 == 1
                return sorted[mid]
            else
                return [sorted[mid - 1], sorted[mid]].average
            end
        end
    end

    def counts
        h = Hash.new(0)
        self.map { |el| h[el] += 1 }
        h
    end

    def my_count(value)
        count = 0
        self.each do |el|
            count += 1 if value == el
        end
        count
    end

    def my_index(value)
        self.each_with_index do |el, i|
            return i if el == value
        end

        nil
    end

    def my_uniq
        uniq = []

        self.each do |el|
            if !uniq.include?(el)
                uniq << el
            end
        end

        uniq
    end

    def my_transpose
        transposed_arr = Array.new(self[0].length) { Array.new(self.length)}
        (0...self.length).each do |i|
            (0...self[0].length).each do |j|
                transposed_arr[j][i] = self[i][j]
            end
        end
        transposed_arr
    end
end
