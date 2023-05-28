def format (value)
  return "₱" + "%.3f" % value
end

def sss_calculation (salary)
  table = [
    [4250, 4749.99, 202.5],
    [4750, 5249.99, 225],
    [5250, 5749.99, 247.5],
    [5750, 6249.99, 270],
    [6250, 6749.99, 292.5],
    [6750, 7249.99, 315],
    [7250, 7749.99, 337.5],
    [7750, 8249.99, 360],
    [8250, 8749.99, 382.5],
    [8750, 9249.99, 405],
    [9250, 9749.99, 427.5],
    [9750, 10249.99, 450],
    [10250, 10749.99, 472.5],
    [10750, 11249.99, 495],
    [11250, 11749.99, 517.5],
    [11750, 12249.99, 540],
    [12250, 12749.99, 562.5],
    [12750, 13249.99, 585],
    [13250, 13749.99, 607.5],
    [13750, 14249.99, 630],
    [14250, 14749.99, 652.5],
    [14750, 15249.99, 675],
    [15250, 15749.99, 697.5],
    [15750, 16249.99, 720],
    [16250, 16749.99, 742.5],
    [16750, 17249.99, 765],
    [17250, 17749.99, 787.5],
    [17750, 18249.99, 810],
    [18250, 18749.99, 832.5],
    [18750, 19249.99, 855],
    [19250, 19749.99, 877.5],
    [19750, 20249.99, 900],
    [20250, 20749.99, 922.5],
    [20750, 21249.99, 945],
    [21250, 21749.99, 967.5],
    [21750, 22249.99, 990],
    [22250, 22749.99, 1012.5],
    [22270, 23249.99, 1035],
    [23250, 23749.99, 1057.5],
    [23750, 24249.99, 1080],
    [24250, 24279.99, 1102.5],
    [24750, 25249.99, 1125],
    [25250, 25749.99, 1147.5],
    [25750, 26249.99, 1170],
    [26250, 26749.99, 1192.5],
    [26750, 27249.99, 1215],
    [27250, 27749.99, 1237.5],
    [27750, 28249.99, 1260],
    [28250, 28749.99, 1282.5],
    [28750, 29249.99, 1305],
    [29250, 29749.99, 1327.5],
    [29750, 1350]]


    for i in 0..table.length do

      if (salary < 4250)
        return 180
      end

      if (i == table.length - 1)
        if (salary >= table[i][0])
          return 1350
        end
      end

      if (salary >= table[i][0] && salary <= table[i][1])
        return table[i][2]
      end
    end
end


def phil_health (salary) 
  if (salary <= 10000)
    return 450 / 2
  elsif (salary >= 10000.01 && salary <= 89999.99)
    return (salary * 0.045) / 2
  elsif (salary >= 90000)
    return 4050 / 2
  end
end


def pag_ibig (salary)

  if (salary <= 1500)
    return salary * 0.01
  elsif (salary > 1500 && salary < 5000)
    return salary * 0.02
  elsif (salary >= 5000)
    return 100
  end
end

def salary_aftertax (salary, taxable_income)

  if (taxable_income <= 20833)
    incomeTax = 0
    new_salary = salary - incomeTax

  elsif (taxable_income >= 20833 && taxable_income <= 33332)
    incomeTax = (taxable_income - 20833) * 0.15
    new_salary = salary - incomeTax
  
  elsif (taxable_income >= 33333 && taxable_income <= 66666)
    incomeTax = ((taxable_income - 33333) * 0.20) + 1875
    new_salary = salary - incomeTax

  elsif (taxable_income >= 66667 && taxable_income <= 166666)
    incomeTax = ((taxable_income - 66666) * 0.25) + 8541.8
    new_salary = salary - incomeTax

  elsif (taxable_income >= 166667 && taxable_income <= 666666)
    incomeTax = ((taxable_income - 166667) * 0.30) + 33541.8
    new_salary = salary - incomeTax

  elsif (taxable_income >= 666667)
    incomeTax = ((taxable_income - 666667) * 0.35) + 183541.8
    new_salary = salary - incomeTax

  end

  return incomeTax, new_salary
end


Monthly_income = (gets.chomp.to_i).round(2)
SSS = sss_calculation Monthly_income
Phil_health = phil_health Monthly_income
Pag_ibig = pag_ibig Monthly_income
Total_Contributions = SSS + Phil_health + Pag_ibig



Taxable_income = Monthly_income - Total_Contributions
Income_Tax, New_Salary  = salary_aftertax Monthly_income, Taxable_income

Total_deduction = Income_Tax + Total_Contributions
Pay_afterdeductions = Monthly_income - Total_deduction

puts ("Income Tax: " + format(Income_Tax)) 
puts ("Net Pay after Tax: " + format(New_Salary)) 
puts ("SSS: " + format(SSS))
puts ("PhilHealth: " + format(Phil_health))
puts ("Pag-IBIG: " + format(Pag_ibig))
puts ("Total Contributions: " + format(Total_Contributions))
puts ("Total Deductions: " + format(Total_deduction))
puts ("Net Pay after Deductions: " + format(Pay_afterdeductions))