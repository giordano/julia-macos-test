// file dummy.c

#include <stdio.h>
#include <stddef.h>
#include <stdbool.h>

int very_long(
    const void *model, size_t num_paths, const char *inits,
    unsigned int seed, unsigned int id, double init_radius, int num_draws,
    int max_history_size, double init_alpha, double tol_obj,
    double tol_rel_obj, double tol_grad, double tol_rel_grad, double tol_param,
    int num_iterations, int num_elbo_draws, int num_multi_draws,
    bool calculate_lp, bool psis_resample, int refresh, int num_threads,
    double *out, size_t out_size, void **err)
{
    printf("in C:\t\t%d\n", num_threads);
    printf("sizeof(bool):\t%lu\n", sizeof(bool));
    fflush(stdout);
    return num_threads;
}
