function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the begining
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        
        summa_deltaE = 0;
        cycle = cycle + 1;
        for y=1:h
            for x=1:w
                current_class_label = mrf.classmask(y, x);
                current_neighbours = [];
                for y__ = max(y-1, 1):min(y+1, h)
                    for x__ = max(x-1, 1):min(x+1, w)
                        if x__ ~= x || y__ ~= y
                            current_neighbours = [current_neighbours, mrf.classmask(y__, x__)];
                        end
                    end
                end
                act_posterior = mrf.logProbs{current_class_label}(y, x);
                act_prior = sum(current_neighbours == current_class_label) * -beta + sum(current_neighbours ~= current_class_label) * beta;
                U_act = act_posterior + act_prior;
                new_class_label = current_class_label;
                while new_class_label == current_class_label && cnum > 1
                    new_class_label = randi(cnum);
                end
                new_posterior = mrf.logProbs{new_class_label}(y, x);
                new_prior = sum(current_neighbours == new_class_label) * -beta + sum(current_neighbours ~= current_class_label) * beta;
                U_new = new_posterior + new_prior;
                dU = U_new - U_act;
                if dU < 0 || (dU > 0 && dU < 1 && dU < exp(-dU/T))
                    summa_deltaE = summa_deltaE + abs(dU);
                    mrf.classmask(y, x) = new_class_label;
                end
            end
        end
        T = T * c;
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end
