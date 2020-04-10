% read CNN_test.bmp and classify
cnn_test = imread('CNN_test.bmp');
cnn_classify = classify(net, cnn_test);
cnn_predict = predict(net, cnn_test);

% adding salt and pepper noise:
spnoise_img = imnoise(cnn_test, 'salt & pepper');
spnoise_classify = classify(net, spnoise_img);
spnoise_predict = predict(net, spnoise_img);

% adding gaussian noise:
gnoise_img = imnoise(cnn_test, 'gaussian');
gnoise_classify = classify(net, gnoise_img);
gnoise_predict = predict(net, gnoise_img);

% gaussian smoothing:
gsmooth_img = imgaussfilt(cnn_test);
gsmooth_classify = classify(net, gsmooth_img);
gsmooth_predict = predict(net, gsmooth_img);

% image sharpening:
sharp_img = imsharpen(cnn_test);
sharp_classify = classify(net, sharp_img)
sharp_predict = predict(net, sharp_img)