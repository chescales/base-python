## Installation

### Set up

Simply run

```shell
make setup
```

This will create the virtual environment, set up the database, create a sample `.env` file
for you, and run migrations.

It is recommended that you activate the virtualenv after `setup`:

```shell
. .venv/bin/activate
```

### Running the project

To run the server:

```shell
make run
```

You can also interact directly with the code if you prefer:

```shell
make shell
```

## Development

If you want to change any of the requirements, you can run the following command and
the production requirements will be updated:

```shell
make requirements
```

And if you edit the code, you can run the linters manually (this would be automatic in a
regular project with pre-commit):

```shell
make precommit
```

## Testing

To run the automated tests, just:

```shell
make test
```
