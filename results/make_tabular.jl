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

for horizon in [7,14,21,28]
    for location in [
        "vietnam",
        "unitedstates",
    ]
        errors_baseline = get_model_errors("baseline", location);
        errors_fb1 = get_model_errors("fb1", location);

        filter!(x -> x.horizon == horizon, errors_baseline)
        filter!(x -> x.horizon == horizon, errors_fb1)

        println("========")
        println(location)
        @printf "%d days\n" horizon
        println("========")

        for col in ["deaths", "new cases", "total cases"]
            errors_col_baseline = errors_baseline[!, col]
            errors_col_fb1 = errors_fb1[!, col]

            print(col)
            print(' ')
            print(location)
            for error in  [errors_col_baseline; errors_col_fb1]
                @printf " & %.4f" error
            end
            @printf "\n\n"
        end
    end
end


for horizon in [7,14,21,28]
    for location in [
        "cook_il",
        "harris_tx",
        "losangeles_ca",
        "maricopa_az",
    ]
        errors_baseline = get_model_errors("baseline", location);
        errors_fb1 = get_model_errors("fb1", location);
        errors_fb2 = get_model_errors("fb2", location);

        filter!(x -> x.horizon == horizon, errors_baseline)
        filter!(x -> x.horizon == horizon, errors_fb1)
        filter!(x -> x.horizon == horizon, errors_fb2)

        println("========")
        println(location)
        @printf "%d days\n" horizon
        println("========")

        for col in ["deaths", "new cases", "total cases"]
            errors_col_baseline = errors_baseline[!, col]
            errors_col_fb1 = errors_fb1[!, col]
            errors_col_fb2 = errors_fb2[!, col]

            print(col)
            print(' ')
            print(location)
            for error in  [errors_col_baseline; errors_col_fb1; errors_col_fb2]
                @printf " & %.4f" error
            end
            @printf "\n\n"
        end
    end
end

for horizon in [7,14,21,28]
    for location in [
        "binhduong",
        "dongnai",
        "hcm",
        "longan"
    ]
        errors_baseline = get_model_errors("baseline", location);
        errors_fb1 = get_model_errors("fb1", location);
        errors_fb2 = get_model_errors("fb2", location);

        filter!(x -> x.horizon == horizon, errors_baseline)
        filter!(x -> x.horizon == horizon, errors_fb1)
        filter!(x -> x.horizon == horizon, errors_fb2)

        println("========")
        println(location)
        @printf "%d days\n" horizon
        println("========")

        for col in ["deaths", "new cases", "total cases"]
            errors_col_baseline = errors_baseline[!, col]
            errors_col_fb1 = errors_fb1[!, col]
            errors_col_fb2 = errors_fb2[!, col]

            print(col)
            print(' ')
            print(location)
            for error in  [errors_col_baseline; errors_col_fb1; errors_col_fb2]
                @printf " & %.4f" error
            end
            @printf "\n\n"
        end
    end
end
