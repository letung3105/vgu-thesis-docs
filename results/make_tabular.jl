cd(@__DIR__)
using DataFrames, CSV
using Printf

function get_model_errors(model, location)
    errors_dir = filter(l -> l == location, readdir(model)) |> first
    errors_dir = joinpath(model, errors_dir)

    errors = filter(f -> endswith(f, "errors.csv"), readdir(errors_dir)) |> first
    errors = joinpath(errors_dir, errors)
    CSV.read(errors, DataFrame)
end

for col in ["deaths", "new cases", "total cases"]
    println("========")
    println(col)
    println("========")

    for horizon in [7, 14, 21, 28]
        @printf "\\multirow{2}{*}{%d}\n" horizon

        for location in [
            "vietnam",
            "unitedstates",
        ]
            errors_baseline = get_model_errors("baseline", location)
            errors_fb1 = get_model_errors("fb1", location)

            filter!(x -> x.horizon == horizon, errors_baseline)
            filter!(x -> x.horizon == horizon, errors_fb1)

            errors_min = Float64[]
            for metric in ["mae", "mape", "rmse"]
                errors_by_metric_baseline = filter(x -> x.metric == metric, errors_baseline)
                errors_by_metric_fb1 = filter(x -> x.metric == metric, errors_fb1)
                push!(errors_min, minimum([
                    errors_by_metric_baseline[!, col]
                    errors_by_metric_fb1[!, col]
                ]))
            end

            errors_col_baseline = errors_baseline[!, col]
            errors_col_fb1 = errors_fb1[!, col]

            locname = if (location == "vietnam")
                "VN"
            elseif (location == "unitedstates")
                "US"
            end

            @printf "& %s" locname
            for error in [errors_col_baseline; errors_col_fb1]
                if error in errors_min
                    @printf " & \\textbf{%.3f}" error
                else
                    @printf " & %.3f" error
                end
            end
            @printf " \\\\ \\cline{2-8}\n"
        end
    end
end



for col in ["deaths", "new cases", "total cases"]
    println("========")
    println(col)
    println("========")

    for horizon in [7, 14, 21, 28]
        @printf "\\multirow{4}{*}{%d}\n" horizon

        for location in [
            "cook_il",
            "harris_tx",
            "losangeles_ca",
            "maricopa_az",
        ]
            errors_baseline = get_model_errors("baseline", location)
            errors_fb1 = get_model_errors("fb1", location)
            errors_fb2 = get_model_errors("fb2", location)

            filter!(x -> x.horizon == horizon, errors_baseline)
            filter!(x -> x.horizon == horizon, errors_fb1)
            filter!(x -> x.horizon == horizon, errors_fb2)

            errors_min = Float64[]
            for metric in ["mae", "mape", "rmse"]
                errors_by_metric_baseline = filter(x -> x.metric == metric, errors_baseline)
                errors_by_metric_fb1 = filter(x -> x.metric == metric, errors_fb1)
                errors_by_metric_fb2 = filter(x -> x.metric == metric, errors_fb2)
                push!(errors_min, minimum([
                    errors_by_metric_baseline[!, col]
                    errors_by_metric_fb1[!, col]
                    errors_by_metric_fb2[!, col]
                ]))
            end

            errors_col_baseline = errors_baseline[!, col]
            errors_col_fb1 = errors_fb1[!, col]
            errors_col_fb2 = errors_fb2[!, col]

            locname = if (location == "cook_il")
                "Cook, IL"
            elseif (location == "harris_tx")
                "Harris, TX"
            elseif (location == "losangeles_ca")
                "Los Angeless, CA"
            elseif (location == "maricopa_az")
                "Maricopa, AZ"
            end

            @printf "& %s" locname
            for error in [errors_col_baseline; errors_col_fb1; errors_col_fb2]
                if error in errors_min
                    @printf " & \\textbf{%.3f}" error
                else
                    @printf " & %.3f" error
                end
            end
            @printf " \\\\ \\cline{2-11}\n"
        end
    end
end


for col in ["deaths", "new cases", "total cases"]
    println("========")
    println(col)
    println("========")

    for horizon in [7, 14, 21, 28]
        @printf "\\multirow{4}{*}{%d}\n" horizon

        for location in [
            "binhduong",
            "dongnai",
            "hcm",
            "longan"
        ]
            errors_baseline = get_model_errors("baseline", location)
            errors_fb1 = get_model_errors("fb1", location)
            errors_fb2 = get_model_errors("fb2", location)

            filter!(x -> x.horizon == horizon, errors_baseline)
            filter!(x -> x.horizon == horizon, errors_fb1)
            filter!(x -> x.horizon == horizon, errors_fb2)

            errors_min = Float64[]
            for metric in ["mae", "mape", "rmse"]
                errors_by_metric_baseline = filter(x -> x.metric == metric, errors_baseline)
                errors_by_metric_fb1 = filter(x -> x.metric == metric, errors_fb1)
                errors_by_metric_fb2 = filter(x -> x.metric == metric, errors_fb2)
                push!(errors_min, minimum([
                    errors_by_metric_baseline[!, col]
                    errors_by_metric_fb1[!, col]
                    errors_by_metric_fb2[!, col]
                ]))
            end

            errors_col_baseline = errors_baseline[!, col]
            errors_col_fb1 = errors_fb1[!, col]
            errors_col_fb2 = errors_fb2[!, col]

            locname = if (location == "binhduong")
                "Binh Duong"
            elseif (location == "dongnai")
                "Dong Nai"
            elseif (location == "hcm")
                "Ho Chi Minh city"
            elseif (location == "longan")
                "Long An"
            end

            @printf "& %s" locname
            for error in [errors_col_baseline; errors_col_fb1; errors_col_fb2]
                if error in errors_min
                    @printf " & \\textbf{%.3f}" error
                else
                    @printf " & %.3f" error
                end
            end
            @printf " \\\\ \\cline{2-11}\n"
        end
    end
end
