correct = 0;
incorrect = 0;
% disp 3 correct, incorrect imgs
[~,~,~,n] = size(testData);
predictlabels = zeros(n, 1);
for i = 1:n
    item = activations(net, testData(:,:,:,i), 'softmax');
    % kinda-not-really cheating by using classify I guess
    % sure, the label's not from the softmax layer
    % but all the final layer does is assign the softmax result to a valid
    % label
    predict_label = classify(net, testData(:,:,:,i));
    Yitem = testLabels(i);
    predictlabels(i, 1) = predict_label;
    
    if predict_label == Yitem
        correct = correct + 1;
    else
        incorrect = incorrect + 1;
    end
    % plot predict bar graph
    % 3 incorrect wasn't quite working right so I hardcoded to 4 oh well
    if (correct < 4 && predict_label == Yitem) || (incorrect < 4 && predict_label ~= Yitem)
    figure;
    X = categorical({'airplane','automobile', 'bird', 'cat', 'deer', 'dog', 'frog', 'horse', 'ship', 'truck'});
    X = reordercats(X,{'airplane','automobile', 'bird', 'cat', 'deer', 'dog', 'frog', 'horse', 'ship', 'truck'});
    bar(X,item(:));
    ylim([0 1]);
    bar_name = '.jpg';
    if predict_label == Yitem
        bar_name = ['Correct_' num2str(i) char(X(cast(Yitem, 'double'))) bar_name];
        title(['Correct ' X(cast(Yitem, 'double'))]);
    else
        bar_name = ['Incorrect_' num2str(i) char(X(cast(Yitem, 'double'))) bar_name];
        title(['Incorrect ' X(cast(Yitem, 'double'))]);
    end
    file = char(bar_name);
    saveas(gcf, ['C:\Users\histo\OneDrive\Documents\UCSD\EE\ECE 172A\HW4\' file])
    
    % show im
    figure;
    imshow(testData(:,:,:,i));
    end
    saveas(gcf, ['C:\Users\histo\OneDrive\Documents\UCSD\EE\ECE 172A\HW4\pic_' file])
end
c = confusionmat(cast(testLabels, 'double'), predictlabels);
confusionchart(c);