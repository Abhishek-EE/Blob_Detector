function percent = image_scaling_at_layer(i, start_perc, end_perc, scale_step_size)
    step_size = (end_perc - start_perc) / (scale_step_size-1); % function which will generate image size relative to kernel size.
    percent = (((i-1) * step_size) / (end_perc - start_perc))^2 * (end_perc - start_perc) + start_perc;
    percent = percent / 100;            % image scaling percentage level( how much will be scaled relative to kernel)