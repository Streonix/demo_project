FROM python:3.9
ARG SECRET_KEY=${SECRET_KEY}

# set the working directory in the container
WORKDIR /code

RUN pip install --upgrade pip && pip install pipenv

# copy the dependencies file to the working directory
COPY Pipfile* .

# install dependencies
RUN pipenv install --system --deploy --ignore-pipfile

# copy the content of the local src directory to the working directory
COPY entrypoint.sh entrypoint.sh

COPY src/ .

# collect static files
RUN python manage.py collectstatic --noinput

VOLUME /code/static
VOLUME /code/media

RUN chmod +x /code/entrypoint.sh

EXPOSE 8000
ENTRYPOINT ["/code/entrypoint.sh"]