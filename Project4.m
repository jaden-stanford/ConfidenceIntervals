n = 10;
X = binornd(n, 0.5, [1, 10000]);
matrix = zeros(10000);

expected_value = n * 0.5;

widths_traditional = matrix(1,:);
widths_agr = matrix(1,:);

count_trad = 0;
count_agr = 0;

 stdev = std(X);
 average = mean(X);

for i = 1 : 10000
   
    p = X(i)/n;
    margin = 1.96* sqrt((p * (1-p))/n);
  
    L = p - margin;
    H = p + margin;
    
    width = H - L;
    widths_traditional(i) = width; 
    
    n2 = n + 4;
    p2 = (X(i) + 2)/n2;
        margin_agr =  1.96 *sqrt((p2*(1 - p2))/n2);
    L_agr = p2 - margin_agr;
    H_agr = p2 + margin_agr;
    if (L_agr < 0)
        L_agr = 0;
    end
    if (H_agr > 1)
        H_agr = 1;
    end
    
    width_agr = H_agr - L_agr;
    widths_agr(i) = width_agr;
    
        if (L < 0.5 && 0.5 < H)
            count_trad = count_trad + 1;
        end
        if (L_agr < 0.5 && 0.5 < H_agr)
            count_agr = count_agr + 1;
        end
  
end

meanwidth_traditional = mean(widths_traditional)

coverage_traditional = count_trad / 10000

meanwidth_agr = mean(widths_agr)

coverage_agr = count_agr / 10000






