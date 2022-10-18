class Array
    def my_each(&blk)
        i = 0
        while i < self.length
            blk.call(self[i])
            i += 1
        end
        self
    end
    def my_select(&blk)
        output = []
        self.my_each do |ele|
            output << ele if blk.call(ele)
        end
        output
    end
    def my_reject(&blk)
        output = []
        self.my_each do |ele|
            output << ele if !blk.call(ele)
        end
        output
    end
    def my_any?(&blk)
        self.any?{|ele| blk.call(ele)}
    end
    def my_all?(&blk)
        self.all?{|ele| blk.call(ele)}
    end
    # ternary ? :
    # one line if cond
    # before ? = bool
    # after ? = true cond
    # : = else
    def my_flatten
        output = []
        # return [self] if !self.is_a?(Array)
        self.my_each do |ele|
            ele.is_a?(Array) ? output += ele.my_flatten : output << ele
        end
        output
    end
    def my_zip(*args)
        output = []
        (0...self.length).each do |i|
            temp = [self[i]]
            args.each do |arr|
                temp << arr[i]
            end
            output << temp
        end
        output
    end
    def my_rotate(num = 1)
        self.rotate(num)
    end
    def my_join(ele = '')
        self.join(ele)
    end
    def my_reverse
        self.reverse
    end
end
