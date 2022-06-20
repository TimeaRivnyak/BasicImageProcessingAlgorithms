function [r_vect, t_vect] = non_max_sup(H, k, p)
    r_vect = [];
    t_vect = [];
        while k > 0
            [~, ind] = max(H(:));
            [r, theta] = ind2sub(size(H), ind);
            r_vect = [r_vect, r];
            t_vect = [t_vect, theta];
            x_1 = max(1, r-p);
            x_2 = min(size(H,1), r+p);
            y_1 = max(1, theta-p);
            y_2 = min(size(H,1), theta+p);
            if H(r, theta) >= 1
                H(x_1:x_2, y_1:y_2) = 0;
            end
            k = k-1;
        end
end