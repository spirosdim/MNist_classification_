% load training set and testing set
train_set = loadMNISTImages('train-images.idx3-ubyte')';
train_label = loadMNISTLabels('train-labels.idx1-ubyte');
test_set = loadMNISTImages('t10k-images.idx3-ubyte')';
test_label = loadMNISTLabels('t10k-labels.idx1-ubyte');

tic; %start  timer 
%Train C-SVM model (multi-class classification)
%kernel_type : polynomial 3 degree :(gamma*u'*v + coef0)^degree
% -d degree   % -g gamma   %-r coef0

model = svmtrain(train_label ,train_set ,'-s 0 -t 1 -d 3' );

 %Test model on the train set  (not required)
%fprintf('**Training prediction:\n');
% predict_train = svmpredict(train_label ,train_set , model);


%Test model on the test set
fprintf('** Testing prediction:\n');
predict_test = svmpredict(test_label ,test_set , model);
toc; %end  timer 