context('mcnemar-test')

test_that('output from mcnemar_test matches the expected result', {

    k <- mcnemar_test(matrix(c(172, 7, 6, 15), nrow = 2))
    expect_equal(k$statistic, 0.0769)
    expect_equal(k$df, 1.000)
    expect_equal(k$pvalue, 0.7815)
    expect_equal(k$exactp, 1.0000)
    expect_equal(k$kappa, 0.6613)
    expect_equal(k$std_err, 0.0873)
    expect_equal(k$kappa_cil, 0.4901)
    expect_equal(k$kappa_ciu, 0.8324)
    expect_equal(k$cases, 0.8900)
    expect_equal(k$controls, 0.8950)
    expect_equal(k$ratio, 0.9944)
    expect_equal(k$odratio, 0.8571)

})


test_that('output from mcnemar_test matches the expected result', {

    k <- mcnemar_test(table(hsb$female, hsb$schtyp))
    expect_equal(k$statistic, 56.4667)
    expect_equal(k$df, 1)
    expect_equal(k$pvalue, 0)
    expect_equal(k$exactp, 0)
    expect_equal(k$kappa, 0.0106)
    expect_equal(unname(k$std_err), 0.0485)
    expect_equal(unname(k$kappa_cil), -0.0846)
    expect_equal(unname(k$kappa_ciu), 0.1057)
    expect_equal(unname(k$cases), 0.455)
    expect_equal(unname(k$controls), 0.84)
    expect_equal(unname(k$ratio), 0.5417)
    expect_equal(k$odratio, 0.1538)

})


test_that('mcnemar_test throws appropriate errors', {
    expect_error(mcnemar_test(c(172, 7, 6, 15)),
                 'x must be either a table or a matrix')
    expect_error(mcnemar_test(matrix(c(172, 7, 6, 15, 20, 25), nrow = 3)),
                 'x must be a 2 x 2 matrix')
    expect_error(mcnemar_test(hsb$female, hsb$schtyp[-1]),
                 'x and y should be of the same length')

})
